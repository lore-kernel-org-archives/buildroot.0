From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Oct 2014 23:11:14 +0200
Subject: [Buildroot] [PATCH 6/6] tar: bump to version 1.28
In-Reply-To: <543D4035.5050308@zacarias.com.ar>
References: <1413284044-20381-1-git-send-email-gustavo@zacarias.com.ar>	<1413284044-20381-6-git-send-email-gustavo@zacarias.com.ar>
 <87bnper9dy.fsf@dell.be.48ers.dk> <543D4035.5050308@zacarias.com.ar>
Message-ID: <543D9172.7030700@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/10/14 17:24, Gustavo Zacarias wrote:
> On 10/14/2014 11:52 AM, Peter Korsgaard wrote:
> 
>> Please add S-O-B and note where it comes from exactly (upstream
>> presumably?)
> 
> It's already upstream from the tar maintainer
> http://git.savannah.gnu.org/cgit/tar.git
> I tend not to touch the pristine ones that are already applied.

 In that case, you should probably not add them to buildroot but instead do

TAR_PATCH = http://git.savannah.gnu.org/cgit/tar.git/patch/?id=e9ddc08da0982f36581ae5a8c7763453ff41cfe8

no?

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
