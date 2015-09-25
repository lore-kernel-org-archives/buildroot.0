From: kei <kei-k@ca2.so-net.ne.jp>
Date: Fri, 25 Sep 2015 22:52:41 +0900
Subject: [Buildroot] [PATCH v12 1/1] squeezelite: new package
In-Reply-To: <5605101A.3090102@imgtec.com>
References: <201509250304.t8P343dO012199@ms-omx03.plus.so-net.ne.jp>
 <5605101A.3090102@imgtec.com>
Message-ID: <50B6B120-73B9-4DF0-8052-7B771774FE98@ca2.so-net.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear, all.

If it is difficult to host it on buildroot, I can host it on my web site.

Please tell me which is preferred.

Regards,
Kawashima

On 2015/09/25, at 18:12, Vicente Olivert Riera <Vincent.Riera@imgtec.com> wrote:
> Peter, Thomas, there is an issue commented below and I think it would be
> good to have your opinion on it.
> On 09/25/2015 04:04 AM, kei-k at ca2.so-net.ne.jp wrote:
>> Dear, Vincente.
>> 
>> Thank you for your test and comment.
>> 
>> Vicente Olivert Riera writes:
>>> Dear Hiroshi Kawashima,
>>> 
>>> are you able to download squeezelite? I'm having this problem:
>>> 
>>>>>> squeezelite v1.8 Downloading
>>> Doing shallow clone
>>> Initialized empty Git repository in
>>> /br/output/build/.squeezelite-v1.8.tar.gz.pb3XtQ/squeezelite-v1.8/
>>> remote: Counting objects: 82, done.
>>> Unpacking objects: 100% (82/82), done.
>>> warning: Remote branch v1.8 not found in upstream origin, using HEAD instead
>>> fatal: unable to read tree 668edec073bef579bedf43817f65aee3a592d0ef
>> Hmm...
>> I have been working on my cached source, so I did not realize it.
>> Yes, I can reproduce your problem with real clean buildroot tree.
>> Maybe something changed https://code.google.com/p/squeezelite repo
>> since my last fetch.
>> I'm considering to change SQUEEZELITE_SITE to github repo like:
>> https://github.com/sixeyed/squeezelite
>> Does this repo work for you too ?
> 
> the fact that it works or not is not the problem. The problem is that
> right now there isn't any official repository for that project, so that
> repository could disappear tomorrow. And I don't know if the owner of
> that repository has made any change to the source code or not.
> 
> Perhaps downloading the tarballs from Google Code and putting them in
> mirror.buildroot.org would be the best option. I have added Peter and
> Thomas on CC so they can tell their opinion about this issue.
