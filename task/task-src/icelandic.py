#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
This experiment was created using PsychoPy2 Experiment Builder (v1.83.04), Thu May 26 21:33:11 2016
If you publish work using this script please cite the relevant PsychoPy publications
  Peirce, JW (2007) PsychoPy - Psychophysics software in Python. Journal of Neuroscience Methods, 162(1-2), 8-13.
  Peirce, JW (2009) Generating stimuli for neuroscience using PsychoPy. Frontiers in Neuroinformatics, 2:10. doi: 10.3389/neuro.11.010.2008
"""

from __future__ import division  # so that 1/3=0.333 instead of 1/3=0
from psychopy import locale_setup, visual, core, data, event, logging, sound, gui
from psychopy.constants import *  # things like STARTED, FINISHED
import numpy as np  # whole numpy lib is available, prepend 'np.'
from numpy import sin, cos, tan, log, log10, pi, average, sqrt, std, deg2rad, rad2deg, linspace, asarray
from numpy.random import random, randint, normal, shuffle
import os  # handy system and path functions
import sys # to get file system encoding

# Ensure that relative paths start from the same directory as this script
_thisDir = os.path.dirname(os.path.abspath(__file__)).decode(sys.getfilesystemencoding())
os.chdir(_thisDir)

# Store info about the experiment session
expName = 'icelandic'  # from the Builder filename that created this script
expInfo = {u'participant': u''}
dlg = gui.DlgFromDict(dictionary=expInfo, title=expName)
if dlg.OK == False: core.quit()  # user pressed cancel
expInfo['date'] = data.getDateStr()  # add a simple timestamp
expInfo['expName'] = expName

# Data file name stem = absolute path + name; later add .psyexp, .csv, .log, etc
filename = _thisDir + os.sep + u'data/%s_%s_%s' %(expInfo['participant'], expName, expInfo['date'])

# An ExperimentHandler isn't essential but helps with data saving
thisExp = data.ExperimentHandler(name=expName, version='',
    extraInfo=expInfo, runtimeInfo=None,
    originPath=None,
    savePickle=True, saveWideText=True,
    dataFileName=filename)
logging.console.setLevel(logging.WARNING)  # this outputs to the screen, not a file

endExpNow = False  # flag for 'escape' or other condition => quit the exp

# Start Code - component code to be run before the window creation

# Setup the Window
win = visual.Window(size=(1280, 800), fullscr=True, screen=0, allowGUI=False, allowStencil=False,
    monitor='testMonitor', color=[0,0,0], colorSpace='rgb',
    blendMode='avg', useFBO=True,
    )
# store frame rate of monitor if we can measure it successfully
expInfo['frameRate']=win.getActualFrameRate()
if expInfo['frameRate']!=None:
    frameDur = 1.0/round(expInfo['frameRate'])
else:
    frameDur = 1.0/60.0 # couldn't get a reliable measure so guess

# Initialize components for Routine "instruction"
instructionClock = core.Clock()
text_2 = visual.TextStim(win=win, ori=0, name='text_2',
    text=u'Hi! Thanks for participating in this study on Icelandic.\n\nThe task consists of reading aloud sentences you will see on the screen. Your voice will be recorded while you are reading.\n\nThe task will not start yet. Press the spacebar now to go to the next page.',    font=u'FreeSans',
    pos=[0, 0], height=0.1, wrapWidth=None,
    color=u'white', colorSpace='rgb', opacity=1,
    depth=0.0)
ISI_2 = core.StaticPeriod(win=win, screenHz=expInfo['frameRate'], name='ISI_2')

# Initialize components for Routine "Instruction_3"
Instruction_3Clock = core.Clock()
text_4 = visual.TextStim(win=win, ori=0, name='text_4',
    text=u'Be sure to read in the most natural way. Try to speak at a normal pace and with a normal intonation, as if you were talking to someone. After you have read aloud one sentence, press the spacebar to see the next sentence.\n\nWhen you are ready to start the task, press the spacebar. You will see a "+" sign for a few seconds and then the task will start.',    font=u'FreeSans',
    pos=[0, 0], height=0.1, wrapWidth=None,
    color=u'white', colorSpace='rgb', opacity=1,
    depth=0.0)
ISI_4 = core.StaticPeriod(win=win, screenHz=expInfo['frameRate'], name='ISI_4')

# Initialize components for Routine "fixation"
fixationClock = core.Clock()
text_6 = visual.TextStim(win=win, ori=0, name='text_6',
    text=u'+',    font=u'Arial',
    pos=[0, 0], height=0.1, wrapWidth=None,
    color=u'white', colorSpace='rgb', opacity=1,
    depth=0.0)

# Initialize components for Routine "trial"
trialClock = core.Clock()
ISI = core.StaticPeriod(win=win, screenHz=expInfo['frameRate'], name='ISI')
text = visual.TextStim(win=win, ori=0, name='text',
    text='default text',    font='FreeSans',
    pos=[0, 0], height=0.15, wrapWidth=None,
    color='white', colorSpace='rgb', opacity=1,
    depth=-1.0)

# Initialize components for Routine "thanks"
thanksClock = core.Clock()
text_7 = visual.TextStim(win=win, ori=0, name='text_7',
    text=u'You have now completed the task.\n\nThanks for your time!\n\nPress the spacebar to end.',    font=u'FreeSans',
    pos=[0, 0], height=0.1, wrapWidth=None,
    color=u'white', colorSpace='rgb', opacity=1,
    depth=0.0)

# Create some handy timers
globalClock = core.Clock()  # to track the time since experiment started
routineTimer = core.CountdownTimer()  # to track time remaining of each (non-slip) routine

#------Prepare to start Routine "instruction"-------
t = 0
instructionClock.reset()  # clock
frameN = -1
# update component parameters for each repeat
key_resp_2 = event.BuilderKeyResponse()  # create an object of type KeyResponse
key_resp_2.status = NOT_STARTED
# keep track of which components have finished
instructionComponents = []
instructionComponents.append(text_2)
instructionComponents.append(key_resp_2)
instructionComponents.append(ISI_2)
for thisComponent in instructionComponents:
    if hasattr(thisComponent, 'status'):
        thisComponent.status = NOT_STARTED

#-------Start Routine "instruction"-------
continueRoutine = True
while continueRoutine:
    # get current time
    t = instructionClock.getTime()
    frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
    # update/draw components on each frame

    # *text_2* updates
    if t >= 0.0 and text_2.status == NOT_STARTED:
        # keep track of start time/frame for later
        text_2.tStart = t  # underestimates by a little under one frame
        text_2.frameNStart = frameN  # exact frame index
        text_2.setAutoDraw(True)

    # *key_resp_2* updates
    if t >= 2.0 and key_resp_2.status == NOT_STARTED:
        # keep track of start time/frame for later
        key_resp_2.tStart = t  # underestimates by a little under one frame
        key_resp_2.frameNStart = frameN  # exact frame index
        key_resp_2.status = STARTED
        # keyboard checking is just starting
        event.clearEvents(eventType='keyboard')
    if key_resp_2.status == STARTED:
        theseKeys = event.getKeys(keyList=['space'])

        # check for quit:
        if "escape" in theseKeys:
            endExpNow = True
        if len(theseKeys) > 0:  # at least one key was pressed
            # a response ends the routine
            continueRoutine = False
    # *ISI_2* period
    if t >= 0.0 and ISI_2.status == NOT_STARTED:
        # keep track of start time/frame for later
        ISI_2.tStart = t  # underestimates by a little under one frame
        ISI_2.frameNStart = frameN  # exact frame index
        ISI_2.start(2)
    elif ISI_2.status == STARTED: #one frame should pass before updating params and completing
        ISI_2.complete() #finish the static period

    # check if all components have finished
    if not continueRoutine:  # a component has requested a forced-end of Routine
        break
    continueRoutine = False  # will revert to True if at least one component still running
    for thisComponent in instructionComponents:
        if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
            continueRoutine = True
            break  # at least one component has not yet finished

    # check for quit (the Esc key)
    if endExpNow or event.getKeys(keyList=["escape"]):
        core.quit()

    # refresh the screen
    if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
        win.flip()

#-------Ending Routine "instruction"-------
for thisComponent in instructionComponents:
    if hasattr(thisComponent, "setAutoDraw"):
        thisComponent.setAutoDraw(False)
# the Routine "instruction" was not non-slip safe, so reset the non-slip timer
routineTimer.reset()

#------Prepare to start Routine "Instruction_3"-------
t = 0
Instruction_3Clock.reset()  # clock
frameN = -1
# update component parameters for each repeat
key_resp_5 = event.BuilderKeyResponse()  # create an object of type KeyResponse
key_resp_5.status = NOT_STARTED
# keep track of which components have finished
Instruction_3Components = []
Instruction_3Components.append(text_4)
Instruction_3Components.append(key_resp_5)
Instruction_3Components.append(ISI_4)
for thisComponent in Instruction_3Components:
    if hasattr(thisComponent, 'status'):
        thisComponent.status = NOT_STARTED

#-------Start Routine "Instruction_3"-------
continueRoutine = True
while continueRoutine:
    # get current time
    t = Instruction_3Clock.getTime()
    frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
    # update/draw components on each frame

    # *text_4* updates
    if t >= 0.0 and text_4.status == NOT_STARTED:
        # keep track of start time/frame for later
        text_4.tStart = t  # underestimates by a little under one frame
        text_4.frameNStart = frameN  # exact frame index
        text_4.setAutoDraw(True)

    # *key_resp_5* updates
    if t >= 2.0 and key_resp_5.status == NOT_STARTED:
        # keep track of start time/frame for later
        key_resp_5.tStart = t  # underestimates by a little under one frame
        key_resp_5.frameNStart = frameN  # exact frame index
        key_resp_5.status = STARTED
        # keyboard checking is just starting
        event.clearEvents(eventType='keyboard')
    if key_resp_5.status == STARTED:
        theseKeys = event.getKeys(keyList=['space'])

        # check for quit:
        if "escape" in theseKeys:
            endExpNow = True
        if len(theseKeys) > 0:  # at least one key was pressed
            # a response ends the routine
            continueRoutine = False
    # *ISI_4* period
    if t >= 0.0 and ISI_4.status == NOT_STARTED:
        # keep track of start time/frame for later
        ISI_4.tStart = t  # underestimates by a little under one frame
        ISI_4.frameNStart = frameN  # exact frame index
        ISI_4.start(2)
    elif ISI_4.status == STARTED: #one frame should pass before updating params and completing
        ISI_4.complete() #finish the static period

    # check if all components have finished
    if not continueRoutine:  # a component has requested a forced-end of Routine
        break
    continueRoutine = False  # will revert to True if at least one component still running
    for thisComponent in Instruction_3Components:
        if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
            continueRoutine = True
            break  # at least one component has not yet finished

    # check for quit (the Esc key)
    if endExpNow or event.getKeys(keyList=["escape"]):
        core.quit()

    # refresh the screen
    if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
        win.flip()

#-------Ending Routine "Instruction_3"-------
for thisComponent in Instruction_3Components:
    if hasattr(thisComponent, "setAutoDraw"):
        thisComponent.setAutoDraw(False)
# the Routine "Instruction_3" was not non-slip safe, so reset the non-slip timer
routineTimer.reset()

#------Prepare to start Routine "fixation"-------
t = 0
fixationClock.reset()  # clock
frameN = -1
routineTimer.add(3.000000)
# update component parameters for each repeat
# keep track of which components have finished
fixationComponents = []
fixationComponents.append(text_6)
for thisComponent in fixationComponents:
    if hasattr(thisComponent, 'status'):
        thisComponent.status = NOT_STARTED

#-------Start Routine "fixation"-------
continueRoutine = True
while continueRoutine and routineTimer.getTime() > 0:
    # get current time
    t = fixationClock.getTime()
    frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
    # update/draw components on each frame

    # *text_6* updates
    if t >= 0.0 and text_6.status == NOT_STARTED:
        # keep track of start time/frame for later
        text_6.tStart = t  # underestimates by a little under one frame
        text_6.frameNStart = frameN  # exact frame index
        text_6.setAutoDraw(True)
    if text_6.status == STARTED and t >= (0.0 + (3-win.monitorFramePeriod*0.75)): #most of one frame period left
        text_6.setAutoDraw(False)

    # check if all components have finished
    if not continueRoutine:  # a component has requested a forced-end of Routine
        break
    continueRoutine = False  # will revert to True if at least one component still running
    for thisComponent in fixationComponents:
        if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
            continueRoutine = True
            break  # at least one component has not yet finished

    # check for quit (the Esc key)
    if endExpNow or event.getKeys(keyList=["escape"]):
        core.quit()

    # refresh the screen
    if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
        win.flip()

#-------Ending Routine "fixation"-------
for thisComponent in fixationComponents:
    if hasattr(thisComponent, "setAutoDraw"):
        thisComponent.setAutoDraw(False)

# set up handler to look after randomisation of conditions etc
trials = data.TrialHandler(nReps=1, method='random',
    extraInfo=expInfo, originPath=-1,
    trialList=data.importConditions('words.csv'),
    seed=None, name='trials')
thisExp.addLoop(trials)  # add the loop to the experiment
thisTrial = trials.trialList[0]  # so we can initialise stimuli with some values
# abbreviate parameter names if possible (e.g. rgb=thisTrial.rgb)
if thisTrial != None:
    for paramName in thisTrial.keys():
        exec(paramName + '= thisTrial.' + paramName)

for thisTrial in trials:
    for i in range(0,3):
        currentLoop = trials
        # abbreviate parameter names if possible (e.g. rgb = thisTrial.rgb)
        if thisTrial != None:
            for paramName in thisTrial.keys():
                exec(paramName + '= thisTrial.' + paramName)

        #------Prepare to start Routine "trial"-------
        t = 0
        trialClock.reset()  # clock
        frameN = -1
        # update component parameters for each repeat
        text.setText(u'Segðu ' + lex + ' aftur.')
        key_resp_4 = event.BuilderKeyResponse()  # create an object of type KeyResponse
        key_resp_4.status = NOT_STARTED
        # keep track of which components have finished
        trialComponents = []
        trialComponents.append(ISI)
        trialComponents.append(text)
        trialComponents.append(key_resp_4)
        for thisComponent in trialComponents:
            if hasattr(thisComponent, 'status'):
                thisComponent.status = NOT_STARTED

        #-------Start Routine "trial"-------
        continueRoutine = True
        while continueRoutine:
            # get current time
            t = trialClock.getTime()
            frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
            # update/draw components on each frame

            # *text* updates
            if t >= 0.5 and text.status == NOT_STARTED:
                # keep track of start time/frame for later
                text.tStart = t  # underestimates by a little under one frame
                text.frameNStart = frameN  # exact frame index
                text.setAutoDraw(True)

            # *key_resp_4* updates
            if t >= 0.5 and key_resp_4.status == NOT_STARTED:
                # keep track of start time/frame for later
                key_resp_4.tStart = t  # underestimates by a little under one frame
                key_resp_4.frameNStart = frameN  # exact frame index
                key_resp_4.status = STARTED
                # keyboard checking is just starting
                win.callOnFlip(key_resp_4.clock.reset)  # t=0 on next screen flip
                event.clearEvents(eventType='keyboard')
            if key_resp_4.status == STARTED:
                theseKeys = event.getKeys(keyList=['space'])

                # check for quit:
                if "escape" in theseKeys:
                    endExpNow = True
                if len(theseKeys) > 0:  # at least one key was pressed
                    key_resp_4.keys = theseKeys[-1]  # just the last key pressed
                    key_resp_4.rt = key_resp_4.clock.getTime()
                    # a response ends the routine
                    continueRoutine = False
            # *ISI* period
            if t >= 0.0 and ISI.status == NOT_STARTED:
                # keep track of start time/frame for later
                ISI.tStart = t  # underestimates by a little under one frame
                ISI.frameNStart = frameN  # exact frame index
                ISI.start(0.5)
            elif ISI.status == STARTED: #one frame should pass before updating params and completing
                ISI.complete() #finish the static period

            # check if all components have finished
            if not continueRoutine:  # a component has requested a forced-end of Routine
                break
            continueRoutine = False  # will revert to True if at least one component still running
            for thisComponent in trialComponents:
                if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
                    continueRoutine = True
                    break  # at least one component has not yet finished

            # check for quit (the Esc key)
            if endExpNow or event.getKeys(keyList=["escape"]):
                core.quit()

            # refresh the screen
            if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
                win.flip()

        #-------Ending Routine "trial"-------
        for thisComponent in trialComponents:
            if hasattr(thisComponent, "setAutoDraw"):
                thisComponent.setAutoDraw(False)
        # check responses
        if key_resp_4.keys in ['', [], None]:  # No response was made
           key_resp_4.keys=None
        # store data for trials (TrialHandler)
        trials.addData('key_resp_4.keys',key_resp_4.keys)
        if key_resp_4.keys != None:  # we had a response
            trials.addData('key_resp_4.rt', key_resp_4.rt)
        # the Routine "trial" was not non-slip safe, so reset the non-slip timer
        routineTimer.reset()
        thisExp.nextEntry()

# completed 1 repeats of 'trials'


#------Prepare to start Routine "thanks"-------
t = 0
thanksClock.reset()  # clock
frameN = -1
# update component parameters for each repeat
key_resp_7 = event.BuilderKeyResponse()  # create an object of type KeyResponse
key_resp_7.status = NOT_STARTED
# keep track of which components have finished
thanksComponents = []
thanksComponents.append(text_7)
thanksComponents.append(key_resp_7)
for thisComponent in thanksComponents:
    if hasattr(thisComponent, 'status'):
        thisComponent.status = NOT_STARTED

#-------Start Routine "thanks"-------
continueRoutine = True
while continueRoutine:
    # get current time
    t = thanksClock.getTime()
    frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
    # update/draw components on each frame

    # *text_7* updates
    if t >= 0.0 and text_7.status == NOT_STARTED:
        # keep track of start time/frame for later
        text_7.tStart = t  # underestimates by a little under one frame
        text_7.frameNStart = frameN  # exact frame index
        text_7.setAutoDraw(True)

    # *key_resp_7* updates
    if t >= 0.0 and key_resp_7.status == NOT_STARTED:
        # keep track of start time/frame for later
        key_resp_7.tStart = t  # underestimates by a little under one frame
        key_resp_7.frameNStart = frameN  # exact frame index
        key_resp_7.status = STARTED
        # keyboard checking is just starting
        win.callOnFlip(key_resp_7.clock.reset)  # t=0 on next screen flip
        event.clearEvents(eventType='keyboard')
    if key_resp_7.status == STARTED:
        theseKeys = event.getKeys(keyList=['space'])

        # check for quit:
        if "escape" in theseKeys:
            endExpNow = True
        if len(theseKeys) > 0:  # at least one key was pressed
            key_resp_7.keys = theseKeys[-1]  # just the last key pressed
            key_resp_7.rt = key_resp_7.clock.getTime()
            # a response ends the routine
            continueRoutine = False

    # check if all components have finished
    if not continueRoutine:  # a component has requested a forced-end of Routine
        break
    continueRoutine = False  # will revert to True if at least one component still running
    for thisComponent in thanksComponents:
        if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
            continueRoutine = True
            break  # at least one component has not yet finished

    # check for quit (the Esc key)
    if endExpNow or event.getKeys(keyList=["escape"]):
        core.quit()

    # refresh the screen
    if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
        win.flip()

#-------Ending Routine "thanks"-------
for thisComponent in thanksComponents:
    if hasattr(thisComponent, "setAutoDraw"):
        thisComponent.setAutoDraw(False)
# check responses
if key_resp_7.keys in ['', [], None]:  # No response was made
   key_resp_7.keys=None
# store data for thisExp (ExperimentHandler)
thisExp.addData('key_resp_7.keys',key_resp_7.keys)
if key_resp_7.keys != None:  # we had a response
    thisExp.addData('key_resp_7.rt', key_resp_7.rt)
thisExp.nextEntry()
# the Routine "thanks" was not non-slip safe, so reset the non-slip timer
routineTimer.reset()
# these shouldn't be strictly necessary (should auto-save)
thisExp.saveAsWideText(filename+'.csv')
thisExp.saveAsPickle(filename)
# make sure everything is closed down
thisExp.abort() # or data files will save again on exit
win.close()
core.quit()
