From: Nikula Jouko <Jouko.Nikula@espotel.com>
Date: Fri, 13 Sep 2013 05:51:39 +0000
Subject: [Buildroot] [PATCH] Update config.guess to version 2013-06-10
In-Reply-To: <87eh8uqxdc.fsf@dell.be.48ers.dk>
References: <1378960962-17411-1-git-send-email-jouko.nikula@espotel.com>
 <87eh8uqxdc.fsf@dell.be.48ers.dk>
Message-ID: <E720F69E63F812489DA4D50AB9BE43F48B1A5E41@ESEXE002.espotel.espotel.fi>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>>>>> "Jouko" == Jouko Nikula <jouko.nikula@espotel.com> writes:

> Jouko> Current version of config.guess may fail to detect host libc version, which  Jouko> results in problems with configure when building gcc.

 >Jouko> Signed-off-by: Jouko Nikula <jouko.nikula@espotel.com>  Jouko> ---  Jouko>  support/gnuconfig/config.guess |  117 +++++++++++++++++++++-------------------
 >Jouko>  1 file changed, 61 insertions(+), 56 deletions(-)

>Please also adjust the git id in README.buildroot.

>What about our patches? I see that atleast the uclibc handling is different here than it used to be.

Ok, I missed the readme and patches totally. Now I tried to apply the patches, but  they can't be applied to the new version of config.guess. I'll see if I can recreate the patches and apply them.
