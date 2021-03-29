import pandas as pd
from datetime import datetime, time, timedelta

def HT_word_plan(
    wl_len: int = 35, 
    short_memory: int = 1, long_memory: int = 5, 
    start_date = '30/Mar/2021',
    week_break: list = [7]): 
    
    """
    # wl_len: length of the word lists;

    # week_break: the weekday in which you could take a break, for example, if you don't want to study in Saturday and Sunday, then input [6,7] as the week_break;
    """

    wl= list(range(1, wl_len+1))
    newlearn =     list()
    short_review = list()
    long_review =  list()
    dates = list()
    days = list()
    dt = datetime.strptime(start_date,'%d/%b/%Y')
    for day in range(wl_len + long_memory):
        dt = dt if ((dt.weekday()+1) not in week_break) else dt +timedelta(days= len(week_break))
        newlearn.append(
            'List '+ str(wl[day]) if day<wl_len else 'Rest')
        short_review.append(
            'List '+ str(wl[day - short_memory]) if (day >= short_memory and day - short_memory < wl_len) else 'Rest')
        long_review.append(
            'List ' + str(wl[day - long_memory]) if day >= long_memory else 'Rest')
        dates.append(dt.strftime('%b %d'))
        days.append(dt.strftime('%A'))
        dt = dt +timedelta(days = 1)
    
    HT_plan = pd.DataFrame(dict(
        Date = dates,
        newlearn = newlearn,
        short_review = short_review,
        long_review = long_review,
        Weekday = days,
    )).rename(index= lambda x: 'Day '+ str(x+1))

    return HT_plan





