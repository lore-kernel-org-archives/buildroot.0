From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 18 Nov 2018 19:35:05 -0200
Subject: [Buildroot] [PATCH v2 3/6] testing/infra/builder: build with
 target and environment
References: <1542426982-54683-3-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <5bf1db0932a14_7ce43f95580d1a605603b@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Another nit that can be fixed while applying.

On Sat, Nov 17, 2018 at 01:56 AM, Matt Weber wrote:

> From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
> 
> Make the builder able to call 'VAR1=1 make VAR2=2 target'.
> 
> Allow to send extra parameters to be added to the end of make command
> line. It can be used for these purposes:
>  - to configure a br2-external, by passing 'BR2_EXTERNAL="dir"';
>  - to specify a make target, such as 'foo-source'.
> 
> Allow to add variables to the environment in which make runs. It can be
> used to override values from environment, such as 'BR2_DL_DIR="dl"'.
> 

> This change will be needed when adding a common class to test the git
> download infra.

This is not untrue.
But in the context of your series, perhaps it could be replaced by:
"
This change will be needed when adding support to br2-externals to the
test infra.
"
And who applies could even tweak this to a better phrase.

> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>

It feels weird to add a tag to my own patch :-)
But I reviewed it and the contents are OK.


Regards,
Ricardo
