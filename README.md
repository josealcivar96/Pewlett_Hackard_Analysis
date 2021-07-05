# Pewlett_Hackard_Analysis

## Overview

The purpose of the following analysis is to parse over the data for the current employees that are part of the Pewlett Hackard corporation. They are required to know which roles will need to be filled on the upcoming wave of employees that are close to the retiring age. As well as figuring out the number of such employees who can be given an option of mentorship within the company, so they can train the new employees who will come by to replace them.

## Results

We performed two important queries: we performed a [count](imgs/count_retiring_titles.png) of all retiring personnel per field of work, we also performed a tally of those who are [eligible](imgs/mentorship_eligibility.png) for the mentorship program that Pewlett Hackard is offering as an option from retirement. Out of these queries we discovered:

- Over 90,000 roles need to be fulfilled for upcoming retirement.
- The roles with a greater number of retirees are Senior Engineers and Senior Staff roles, while managers are few to replace with only 2 managers upcoming for retirement.
- Over 1,500 employees are eligible for the mentorship program.
- Senior Staff and Engineer positions have the greatest eligibility for the mentorship program. There are no managers available for the mentorship role.

## Summary

A large number of employees have become to be on the verge of retiring. Knowing this information beforehand allows us to act accordingly when this "Silver Tsunami" finally hits. As stated before in the "Results" section, exactly **90398** positions to be filled once the personnel retires.

If a mentorship program is to take place, it is to be noted that there is not enough eligible mentors such that they may train every new hire *individually*. There are over 1,500 employees eligible for mentorship, which gives a number of **60** new hires per mentor on **average**. However if new hires are able to bundle in groups and mentors allowed to mentor more than one group, the mentorship program may ultimately be successful.

Additionally, in order to get a better picture of the upcoming wave of retirees, we needed to run a couple of additional queries to get clearer information:
- We created a new table that gathers [mentorship count](imgs/count_mentorship_by_title.png) and grouped it by title. This is how we realize that the Senior Staff and Engineers have the greatest number of mentors available and there are no mentors available for department managers.
- We also ran a query for the [ratio](imgs/ratio_of_students_per_mentor.png) of new positions to mentors, sorted per field. We can see that the program may work better for the positions of Assistant Engineers and Engineers since they would have to oversee a smaller number of new hires. On the other hand, there may be a better way to handle new hires for Senior Engineers as there are **174** available positions per mentor. Perhaps a seminar program or larger mentor groups, as Senior Engineers may need small training and oversight to get into their new positions.
