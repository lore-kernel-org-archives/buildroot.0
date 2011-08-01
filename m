From: Mike Williams <mike@mikebwilliams.com>
Date: Mon, 1 Aug 2011 10:47:52 -0400
Subject: [Buildroot] [PATCH 3/3] samba: bump to version 3.3.15
In-Reply-To: <1312137706.7121.2.camel@bender>
References: <1311884043-2473-1-git-send-email-gustavo@zacarias.com.ar>
 <1311884043-2473-3-git-send-email-gustavo@zacarias.com.ar>
 <1312137706.7121.2.camel@bender>
Message-ID: <CANPyyuO6nbVNzGtb3P_Eajdr8--9qaybTwi251EjAaDqsxZzAg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jul 31, 2011 at 2:41 PM, Sven Neumann <s.neumann@raumfeld.com> wrote:
> On Thu, 2011-07-28 at 17:14 -0300, Gustavo Zacarias wrote:
>> Bump samba to version 3.3.15 and add security patches for CVE-2011-2522
>> and CVE-2011-2694.
>>
>> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
>
> Why does buildroot still stick to such an old version of samba? We are
> sucessfully using 3.5.9 in our branch (and could, and should, update to
> 3.5.10 easily). Would you like me to submit a patch to update samba to
> version 3.5.x ?
>
>
> Sven

Please post your patch. I just started using 3.5.10, and have been
working through problems with the codepages and determining which
patches are still relevant. I can at least confirm it builds on
powerpc-glibc with no patches and minor samba.mk fixes.

Thanks,
Mike
