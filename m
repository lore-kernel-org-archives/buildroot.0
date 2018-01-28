From: =?UTF-8?Q?Stefan_Fr=c3=b6berg?= <stefan.froberg@petroprogram.com>
Date: Mon, 29 Jan 2018 01:43:20 +0200
Subject: [Buildroot] [PATCH v2 1/1] unbound: new package
In-Reply-To: <87wp02dk9e.fsf@dell.be.48ers.dk>
References: <20180113222651.22755-1-stefan.froberg@petroprogram.com>
 <uagqiexfnk.ln2@ID-313208.user.individual.net>
 <6b37de5d-dd14-17a8-44a8-bd9b078c2920@petroprogram.com>
 <jtksiex3i1.ln2@ID-313208.user.individual.net>
 <1a1a4349-bb17-6657-1d60-2e8c7891b0e9@petroprogram.com>
 <8i82jex0fn.ln2@ID-313208.user.individual.net>
 <2cacb101-8c6b-7eab-8c5f-0f67e32bf183@petroprogram.com>
 <87wp02dk9e.fsf@dell.be.48ers.dk>
Message-ID: <49a25eef-8d91-4acc-769a-b46d55ed09bb@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter

Yes, I try to go throught them all tomorro.
Already checked some of them and they give me error because I don't have
32-bit libs on my pure, non-multilib 64-bit system.
So those ones I can't check out.

Best Regards
Stefan

Peter Korsgaard kirjoitti 28.01.2018 klo 18:24:
>>>>>> "Stefan" == Stefan Fr?berg <stefan.froberg@petroprogram.com> writes:
> Hi,
>
>  >> and forgot to add "-d" before $HOME/test-unbound, sorry.
>  >> 
>  > No problem at all :-)
>
> Will you send an updated patch once you have looked at those build
> failures? I have so far marked the patch as changes requested in
> patchwork.
>
