From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 Oct 2013 13:07:36 +0100
Subject: [Buildroot] [PATCH 1/1] trace-cmd: overwrite CFLAGS
In-Reply-To: <20131030090857.0b9555e6@skate>
References: <526D9ED3.4000401@openwide.fr> <526FEAD0.7090908@mind.be>
 <20131030090857.0b9555e6@skate>
Message-ID: <5270F688.3060901@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30/10/13 09:08, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
>
> On Tue, 29 Oct 2013 18:05:20 +0100, Arnout Vandecappelle wrote:
>
>>    However, we should also add NO_PTRACE to TRACE_CMD_MAKE_OPTS if
>> BR2_PACKAGE_PTRACE is not selected, and add ptrace to the dependencies if
>> it is.
>
> Huh? ptrace is not a package, it's a libc function. See man ptrace(2).

  D'oh!

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
