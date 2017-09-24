From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 24 Sep 2017 18:45:33 +0200
Subject: [Buildroot] [PATCH 2/2] uboot-tools: bump to version 2017.09
In-Reply-To: <CAOMZO5Dn536fDzp7jmg+4vNVW81LGxvBMXpuXEC-0=QkGy2Z8w@mail.gmail.com>
References: <1505157066-25651-1-git-send-email-festevam@gmail.com>
 <1505157066-25651-2-git-send-email-festevam@gmail.com>
 <87vakn656b.fsf@dell.be.48ers.dk>
 <CAOMZO5Cy39dYHhhRA05UgG_T=P98w57RcESzonyTJvpwVH=yeA@mail.gmail.com>
 <87mv5z61zs.fsf@dell.be.48ers.dk>
 <CAOMZO5Dn536fDzp7jmg+4vNVW81LGxvBMXpuXEC-0=QkGy2Z8w@mail.gmail.com>
Message-ID: <3652605d-ef46-081f-aec1-4b41b02c822d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12-09-17 23:41, Fabio Estevam wrote:
> On Tue, Sep 12, 2017 at 6:28 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
> 
>> That seems to only build host-uboot-tools. The error I pasted was from
>> uboot-tools (E.G. build for the target).
> 
> Could not get the failure here.
> 
> Which defconfig do you use?

 I can reproduce with any defconfig I try.

 I think the issue is that the "env" target was renamed to "envtools".

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
