From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 2 Oct 2015 12:42:38 -0300
Subject: [Buildroot] qemu-system mode on host
In-Reply-To: <3CBEEA60777E57409651B77A951BDFD2F478F1@FR712WXCHMBA14.zeu.alcatel-lucent.com>
References: <3CBEEA60777E57409651B77A951BDFD2F478F1@FR712WXCHMBA14.zeu.alcatel-lucent.com>
Message-ID: <560EA5EE.1020802@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/10/15 12:44, MAES, Simon (Simon)** CTR ** wrote:

> Dear,
>
> I was reading the mail thread concerning the support for qemu-system
> mode on host in Buildroot (December 2013).
> [http://lists.busybox.net/pipermail/buildroot/2013-December/083885.html]
>
> Happy to read that you already did some work integrating this feature in
> Buildroot. Currently I?m using Buildroot 2015.05 and noticed that this
> support is not (yet?) available in this Buildroot version.
>
> Are there any plans bringing this feature upstream? If not, do you mind
> to explain me why, understanding the reasoning will help me making
> change sets that are worth contributing.

Hi Simon.
It wasn't added to buildroot because there were different opinions on 
how it should be implemented, most developers wanted it integrated with 
the main qemu package, i wanted to keep it split because of emulation 
bugs for each different platform.

> @Gustavo, I?m wondering if you perhaps have a more recent, (private)
> patch that you are willing to share?
>
> Thanks in advance,
>
> Kind regards,
>
> Simon

It's somewhat bitrot since i'm using a different approach to qemu config 
testing, and not too different than the last version that i've sent to 
the list, it surely doesn't apply to master as it is.
Regards.
