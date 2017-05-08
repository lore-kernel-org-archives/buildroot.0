From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 8 May 2017 16:33:33 +0200
Subject: [Buildroot] Buildroot defconfig failures
In-Reply-To: <bcb5bdd6-08a2-4782-70f4-0a4db45c41ab@c-sky.com>
References: <20170507145548.336e29ad@free-electrons.com>
 <df95a70f-0e89-750f-1702-25998944fc3a@c-sky.com>
 <20170508142023.6b95ccf7@free-electrons.com>
 <bcb5bdd6-08a2-4782-70f4-0a4db45c41ab@c-sky.com>
Message-ID: <2a49a86b-da86-6e7e-df4d-bf857d3ee66c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-05-17 15:43, ren_guo wrote:
> hi Thomas,
> 
>> Yes, it's OK here as well. And it seems to work fine on Gitlab CI for
>> many other toolEchains as well. So we have something weird here.
> 
> We will try to make a Gitlab CI environment to determine csky-linux-gcc problem.

 You can just create a gitlab account, fork the official gitlab buildroot
repository, modify .gitlab-ci.yml and push it. The you use the real gitlab
server for you debugging.

 You can do this on a branch that you delete later to "forget" about this
debugging run.

 Regards,
 Arnout

> 
>> Where will you add the hash? You can't add the hash in Buildroot for
>> custom external toolchains.
> 
> En... I want to add a toolchain-external-csky, is that ok?
> 
> Best Regards
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
