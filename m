From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 18 Nov 2018 19:41:53 -0200
Subject: [Buildroot] [PATCH v2 4/6] testing/infra/basetest: support
 br2-external
References: <1542426982-54683-4-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <5bf1dca178106_7ce43f955809f26856228@ultri5.mail>
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

> This change will be needed when adding a common class to test the git
> download infra.

Just like in patch 3, this is not untrue.
But in the context of your series, perhaps it could be replaced by:
"
Some upcoming test cases can use one or more br2-external trees as
fixtures that provide packages used only in runtime tests.

Add support for br2-external into the BRTest class. Any test case can
then provide a list of paths for be used as br2-external trees during
the build of the image to be tested.
"
And who applies it could even tweak this to a better phrase.

> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> ---

I reviewed it and the contents are OK.


Regards,
Ricardo
