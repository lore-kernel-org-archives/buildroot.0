From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 04 Feb 2014 09:55:33 +0100
Subject: [Buildroot] [pkg-perl infra V3 00/12] a package infrastructure
 for Perl/CPAN modules
In-Reply-To: <52F0A9B5.1070900@mind.be>
References: <1385198749-6249-1-git-send-email-francois.perrad@gadz.org>
 <52F0A9B5.1070900@mind.be>
Message-ID: <52F0AB05.9080705@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/02/14 09:49, Arnout Vandecappelle wrote:
>  libxml-libxml-perl fails to build with:
> 
> make[2]: *** No rule to make target `pure_all'.  Stop.
> 

 Looks like the error actually was:

Checking for ability to link against libxml2...libxml2, zlib, and/or the
Math library (-lm) have not been found.
Try setting LIBS and INC values on the command line

 So another problem is that configure failures are not detected. If you
can find a solution for that, that would be great.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
