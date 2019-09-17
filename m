From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Sep 2019 21:40:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/openvmtools: source default file
In-Reply-To: <1568712701-114422-1-git-send-email-simon.rowe@citrix.com>
References: <1568712701-114422-1-git-send-email-simon.rowe@citrix.com>
Message-ID: <20190917214015.0d602a17@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Simon,

On Tue, 17 Sep 2019 10:31:41 +0100
Simon Rowe <simon.rowe@citrix.com> wrote:

> In the SYSV init script allow /etc/default/vmtoolsd to override $ARGS
> (if it present)
> 
> Signed-off-by: Simon Rowe <simon.rowe@citrix.com>
> ---
>  package/openvmtools/S10vmtoolsd | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks. However, it would be nice to convert this
init script to our new "template", which can be seen in
package/busybox/S01syslogd.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
