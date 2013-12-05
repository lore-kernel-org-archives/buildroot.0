From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 05 Dec 2013 23:29:36 +0100
Subject: [Buildroot] mono runtime porting to buildroot
In-Reply-To: <000b01ceef4c$9a7ded20$cf79c760$@elgsis.com>
References: <000b01ceef4c$9a7ded20$cf79c760$@elgsis.com>
Message-ID: <52A0FE50.9000506@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/12/13 11:52, Linas Lisauskas wrote:
> Hi,
>
> I have a question. Maybe somebody of Your team tried to port mono project
> for buildroot. I was using openembedded dist, but is the requirement to
> use buildroot dist and mono project. Can anyone help write *.mk file for
> this? I have cross compiled mono project with native buildroot toolchain.

  Your question for help is a bit vague. Start out with [1] for general 
information of how to write the buildroot integration for a package. If 
you're unsure about something, just post a patch (preferably with git 
send-email [2]) and ask concrete questions. Also if you have some 
cross-compilation issue, post the .mk file you tried and which issue you 
encountered.

  Regards,
  Arnout

[1] http://buildroot.net/downloads/manual/manual.html#adding-packages
[2] http://buildroot.net/downloads/manual/manual.html#submitting-patches

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
