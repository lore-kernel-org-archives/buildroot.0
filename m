From: Peter Thompson <peter.macleod.thompson@gmail.com>
Date: Wed, 29 Aug 2018 03:21:59 -0600
Subject: [Buildroot] SDL2+directfb combo does not work as built by
 buildroot-2018.02.3
In-Reply-To: <CAGrGpJBNF=NejuNA5hBg5oet=iJxEjRLBXgog30y4xm0GrFFjA@mail.gmail.com>
References: <CAGrGpJDVHStp8MUZaGb1=ZfWud-k4fQP=piwsc-QfftCDFyKog@mail.gmail.com>
 <CAGrGpJA=Kk0fGjMPfH3R1ZbyJbonPNPQoyC_tpjaF9Ua92BNNg@mail.gmail.com>
 <878t4q7vqu.fsf@dell.be.48ers.dk>
 <CAGrGpJCe67xHWAceYw6-oD=iPoL0be8-ZhRgmWfhQRuG0GwxeA@mail.gmail.com>
 <87a7p65zjo.fsf@dell.be.48ers.dk>
 <CAGrGpJBNF=NejuNA5hBg5oet=iJxEjRLBXgog30y4xm0GrFFjA@mail.gmail.com>
Message-ID: <CAGrGpJBb5QSj6utj46840=bKhHEg5npdt23+NCrU87Ta-Yv7Qw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that I see how easy it is ... add file containing Sam's patch called

0001-hg-libsdl-org-SDL-raw-rev-751cdc74d55c.patch
to the SDL2 package

... I can easily submit a proper patch with signed-of-by to buildroot

Let me know what you would like.....
<https://hg.libsdl.org/SDL/raw-rev/751cdc74d55c>
Peter


On Tue, Aug 28, 2018 at 10:56 AM, Peter Thompson <
peter.macleod.thompson@gmail.com> wrote:

> I checked with Sam - this is his note back...
>
> "I'm not sure, but I think we're going to start on it soon. We have a
> bunch of good improvements in 2.0.9 for folks."
>
>
>
> On Tue, Aug 28, 2018 at 8:35 AM, Peter Korsgaard <peter@korsgaard.com>
> wrote:
>
>> >>>>> "Peter" == Peter Thompson <peter.macleod.thompson@gmail.com>
>> writes:
>>
>>  > Hi Peter
>>  > My original plan was to wait for the next SDL2 release thereby allowing
>>  > SDL2 to fix itself before updating the SDL2_VERSION in  buildroot.
>>
>>  > Otherwise we have to change buildroot SDL2_VERSION to  point to the
>>  > temporary patched SDL2 source for download:
>>  > http://www.libsdl.org/tmp/SDL-2.0.zip
>>  > OR
>>  > somehow change buildroot to download this patch and apply it to the
>>  > downloaded SDL2-2.0.8 before compiling (I am not sure how to do this in
>>  > buildroot).
>>
>> .. Or simply include the hg commit as a .patch file in the package.
>>
>>  > Then we would need to re-change this all back when the new release of
>> SDL2
>>  > incorporates this patch.
>>
>> Correct.
>>
>> Do you know when sdl2-2.0.9 is planned? 2.0.8 is what we are using both
>> for 2018.02 (the current long term support version), 2018.05 (the
>> current release) and master (what will very soon become 2018.08).
>>
>> --
>> Bye, Peter Korsgaard
>>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180829/9dac281e/attachment.html>
