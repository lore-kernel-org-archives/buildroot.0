From: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Date: Tue, 6 Jun 2017 18:00:47 +0200
Subject: [Buildroot] [PATCH] package/tslib: bump version to 1.11
In-Reply-To: <8737bdcdme.fsf@dell.be.48ers.dk>
References: <20170606125009.26537-1-martin.kepplinger@ginzinger.com>
 <87bmq1cfce.fsf@dell.be.48ers.dk>
 <1e33fbf7-4a80-006b-4ec9-2dc11feb3b6b@ginzinger.com>
 <8737bdcdme.fsf@dell.be.48ers.dk>
Message-ID: <fd771083-e067-3ee5-8159-5e10a5d64f84@ginzinger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2017-06-06 17:58, Peter Korsgaard wrote:
>>>>>> "Martin" == Martin Kepplinger <martin.kepplinger@ginzinger.com> writes:
> 
>  > On 2017-06-06 17:20, Peter Korsgaard wrote:
>  >>>>>>> "Martin" == Martin Kepplinger <martin.kepplinger@ginzinger.com> writes:
>  >> 
>  >> > Release notes for the curious:
>  >> >    https://github.com/kergoth/tslib/blob/master/NEWS
>  >> 
>  >> Sorry, forgot to ask:
>  >> 
>  >> NEWS states:
>  >> 
>  >> This release includes the following bugfixes:
>  >> * ff8c7d9 use dlfcn.h dynamic loading function only if libdl is available
>  >> 
>  >> 
>  >> Does this mean that we can drop the dependency on !BR2_STATIC_LIBS?
>  >> 
> 
>  > Yes. I planned to send this change when this is applied :)
> 
> Ahh, ok. For future reference, it is fine to include such changes in the
> version bump change.
> 

oh. alright. sorry for the overhead now.
