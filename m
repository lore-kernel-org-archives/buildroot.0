From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 19 Sep 2017 21:25:01 +0200
Subject: [Buildroot] [PATCH 2/2] configs: Add qemu_ppc64le_pseries
In-Reply-To: <20170919005538.1482-3-joel@jms.id.au>
References: <20170919005538.1482-1-joel@jms.id.au>
 <20170919005538.1482-3-joel@jms.id.au>
Message-ID: <f483d6c3-67cd-69a8-f54b-e8fc59528660@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Joel,

On 19-09-17 02:55, Joel Stanley wrote:
> This is similar to the ppc64_pseries config, except we build for little
> endian instead of big endian.
> 
> The default architecture is set to Power8 as this was the first fully
> enabled LE machine.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

 Three things are missing:

- a readme file in board/qemu/ppc64le-pseries/readme.txt;
- an update of .gitlab-ci.yml (just run 'make .gitlab-ci.yml');
- adding yourself to the DEVELOPERS file.

 Care to send an updated patch with all this?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
