From: kei <kei-k@ca2.so-net.ne.jp>
Date: Sat, 26 Sep 2015 00:34:39 +0900
Subject: [Buildroot] [PATCH v12 1/1] squeezelite: new package
In-Reply-To: <AF2714BD-425E-4CC0-899D-CCBD9C33448B@ca2.so-net.ne.jp>
References: <201509250304.t8P343dO012199@ms-omx03.plus.so-net.ne.jp>
 <5605101A.3090102@imgtec.com> <20150925161420.05e33e90@free-electrons.com>
 <560557BB.6080800@imgtec.com> <560558BD.1030905@imgtec.com>
 <AF2714BD-425E-4CC0-899D-CCBD9C33448B@ca2.so-net.ne.jp>
Message-ID: <8C444A3A-D9A3-4DAD-A7BF-E70FF76999A9@ca2.so-net.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry, s/squeeze-source/squeezelite-source/

On 2015/09/26, at 0:04, kei <kei-k@ca2.so-net.ne.jp> wrote:

> Dear, Vincente.
> 
> Probably you are misunderstanding.
> Full git clone is working, but shallow clone (of buildroot/support/download/git script)
> does not work for this repo.
> That was pointed out by you, shallow clone does not work.
> Try again make squeeze-source.
> 
> Kawashima
> 
> On 2015/09/25, at 23:22, Vicente Olivert Riera <Vincent.Riera@imgtec.com> wrote:
> 
>> Hi everyone,
>> 
>> On 09/25/2015 03:18 PM, Vicente Olivert Riera wrote:
>>> Hi Thomas,
>>> 
>>> On 09/25/2015 03:14 PM, Thomas Petazzoni wrote:
>>>> Hello,
>>>> 
>>>> On Fri, 25 Sep 2015 10:12:58 +0100, Vicente Olivert Riera wrote:
>>>> 
>>>>>>>>>> squeezelite v1.8 Downloading
>>>>>>> Doing shallow clone
>>>>>>> Initialized empty Git repository in
>>>>>>> /br/output/build/.squeezelite-v1.8.tar.gz.pb3XtQ/squeezelite-v1.8/
>>>>>>> remote: Counting objects: 82, done.
>>>>>>> Unpacking objects: 100% (82/82), done.
>>>>>>> warning: Remote branch v1.8 not found in upstream origin, using HEAD instead
>>>>>>> fatal: unable to read tree 668edec073bef579bedf43817f65aee3a592d0ef
>>>>>> Hmm...
>>>>>> I have been working on my cached source, so I did not realize it.
>>>>>> Yes, I can reproduce your problem with real clean buildroot tree.
>>>>>> Maybe something changed https://code.google.com/p/squeezelite repo
>>>>>> since my last fetch.
>>>>>> I'm considering to change SQUEEZELITE_SITE to github repo like:
>>>>>> https://github.com/sixeyed/squeezelite
>>>>>> Does this repo work for you too ?
>>>>> 
>>>>> the fact that it works or not is not the problem. The problem is that
>>>>> right now there isn't any official repository for that project, so that
>>>>> repository could disappear tomorrow. And I don't know if the owner of
>>>>> that repository has made any change to the source code or not.
>>>>> 
>>>>> Perhaps downloading the tarballs from Google Code and putting them in
>>>>> mirror.buildroot.org would be the best option. I have added Peter and
>>>>> Thomas on CC so they can tell their opinion about this issue.
>>>> 
>>>> What do you want to do this instead of just using the Google Code
>>>> tarballs? Yes, I know Google Code will disappear in the future, but
>>>> right now, it works, and by the time it will be shut down, hopefully
>>>> this project will have found a new hosting.
>>> 
>>> Because I don't see any tarball in Google Code which contains the
>>> sources. All I see are binary builds:
>>> 
>>> https://code.google.com/p/squeezelite/downloads/list?can=1&q=
>> 
>> anyway, I think the git repo on Google Code started working again:
>> 
>> $ git clone https://code.google.com/p/squeezelite/
>> Initialized empty Git repository in /git-clones/squeezelite/.git/
>> remote: Counting objects: 845, done.
>> Receiving objects: 100% (845/845), 286.68 KiB, done.
>> Resolving deltas: 100% (570/570), done.
>> $
>> 
>> Regards,
>> 
>> Vincent.
>> 
>>> Regards,
>>> 
>>> Vincent.
>>> 
>>>> 
>>>> Thomas
>>>> 
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot at busybox.net
>>> http://lists.busybox.net/mailman/listinfo/buildroot
>>> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
