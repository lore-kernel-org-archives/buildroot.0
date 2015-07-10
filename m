From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 11 Jul 2015 00:24:50 +0200
Subject: [Buildroot] [PATCH] qpid-proton: new package
In-Reply-To: <1436544600-18532-1-git-send-email-luca@lucaceresoli.net>
References: <1436544600-18532-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <55A04632.4050508@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/10/15 18:10, Luca Ceresoli wrote:
> Note: the tarball is buggy, as is contains two leading components instead of
> one, the first being a dummy ".":
> 
>   $ tar taf ~/src/qpid-proton-0.9.1.tar.gz
>   ./
>   ./qpid-proton-0.9.1-rc1/
>   ./qpid-proton-0.9.1-rc1/version.txt

 Would it make sense to add an <PKG>_STRIP_COMPONENTS variable to handle this
case? There are a few other packages that have this problem.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
