From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 24 Oct 2019 00:27:00 +0200
Subject: [Buildroot] [PATCH 1/1] support/scripts: added support for
 system and normal uid/gid.
In-Reply-To: <20191023211313.6758-1-stephan+buildroot@asklandd.dk>
References: <20191023211313.6758-1-stephan+buildroot@asklandd.dk>
Message-ID: <6d916570-a766-3dc5-94c2-acc438b622d7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Stephan,

On 23/10/2019 23:13, Stephan Henningsen wrote:
> Signed-off-by: Stephan Henningsen <stephan+buildroot@asklandd.dk>

 What exactly is the difference between a system uid and a normal uid?

 I remember back in the days before dynamic uid assignment, it was customary to
make sure that the uids created by the sysadmin were in a high range, distinct
from the uids created by the package manager. I guess this was because the
package manager's uids are always local, while the sysadmin's uids could be used
over NFS. But I'm not a sysadmin :-)

 However, I don't see how this could ever be relevant in a Buildroot context.
Can you give an example of how this is supposed to be used?

 Regards,
 Arnout
