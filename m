From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 19 Nov 2013 00:19:36 +0100
Subject: [Buildroot] [PATCH v3 3/5] eudev: new package.
In-Reply-To: <20131118150247.GB13924@pc-eric>
References: <1383752078-25315-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1383752078-25315-4-git-send-email-eric.le.bihan.dev@free.fr>
 <20131113234133.2b964da0@skate> <20131118150247.GB13924@pc-eric>
Message-ID: <528AA088.4030305@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/11/13 16:02, Eric Le Bihan wrote:
> Hi!
>
> On Wed, Nov 13, 2013 at 11:41:33PM +0100, Thomas Petazzoni wrote:
>
>>> > >+	  eudev requires a Linux kernel >= 2.6.34: it relies on devtmpfs.
>> >
>> >I thought devtmpfs was added in 2.6.32. Are there other kernel features
>> >that are needed to make eudev work?
> That's a typo. There are no exotic dependencies (unlike systemd which requires
> cgroup and tmpfs).
>
>> >Are you using "git format-patch -M" to create your patches? It detects
>> >renames/copies, and this file appears to be a copy of the one in
>> >package/udev/, no?
> Surprisingly, '-M' is not enough. I must use the '--find-copies-harder' option
> to detect the file copy.

  Since it's a copy, not a rename, you'd have to use -C.

  Regards,
  Arnout


[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
