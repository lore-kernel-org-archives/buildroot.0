From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 19 Oct 2012 21:58:23 +0200
Subject: [Buildroot] Local SVN respository
In-Reply-To: <1350664899.14081.7.camel@john-ubu>
References: <1350547544.8368.8.camel@john-ubu> <5080617F.9000008@mind.be>
 <1350664899.14081.7.camel@john-ubu>
Message-ID: <5081B0DF.6000208@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/10/12 18:41, john wrote:
> Thank you for your help, in answer to your questions,
> The package is already in buildroot, at the moment I have the same
> version number and I have created it under the same name. It is selected
> in the config and when I do make with debug (-p) on I get:
>
> svn: Syntax error in revision argument '1.0.1'
>
> my svn command is
> MYPACKAGE_SITE=svn://myserver/mydir/trunk/mysoftware-1.0.1/

  Ah, of course, I forgot that subversion doesn't have tags...  You
should change MYPACKAGE_VERSION to the svn revision number you need,
or HEAD.


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
