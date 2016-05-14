From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 14 May 2016 23:20:01 +0200
Subject: [Buildroot] [PATCH v1] Makefile: fix rootfs overlay with
 BR2_ROOTFS_MERGED_USR enabled
In-Reply-To: <20160512210625.6c04e7d8@gmx.net>
References: <1461439109-28101-1-git-send-email-ps.report@gmx.net>
 <20160508141313.GD24011@free.fr> <20160512210625.6c04e7d8@gmx.net>
Message-ID: <a49b8176-f38e-5ce0-b088-6ff7bd03310e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/12/16 21:06, Peter Seiderer wrote:
> Hello Yann,
>
> On Sun, 8 May 2016 16:13:13 +0200, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
>
>> Peter, All,
>>
>> Nit-picking: when you send the 'v1' of a patch, you need not add 'v1' to
>> it. Only 'v2' and above need a version /tag/.
>>
>
> Yes I know it is not necessary...., but I find it supportive for my 'workflow',
> having local copies of the sent patches combined e.g.
>
>   v1-0001-some-patch-subject.patch
>   v2-0001-some-patch-subject.patch
>   ....
>
> instead of
>
>   0001-some-patch-subject.patch
>   v2-0001-some-patch-subject.patch
>
> But I can try to change my habit in case more mailing list people prefer it otherwise...

  It certainly doesn't bother me, and I doubt that interferes with Peter's or 
Thomas's workflow too. So unless they object a second time, just keep on doing 
what works for you.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
