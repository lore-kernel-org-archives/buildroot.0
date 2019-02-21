From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 Feb 2019 09:32:03 +0100
Subject: [Buildroot] [git commit] package/syslog-ng: add optional
 rabbitmq-c dependency
In-Reply-To: <20190220222409.4FDA88B910@busybox.osuosl.org>
References: <20190220222409.4FDA88B910@busybox.osuosl.org>
Message-ID: <20190221093203.3547119a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 20 Feb 2019 23:26:04 +0100
Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> wrote:

> commit: https://git.buildroot.net/buildroot/commit/?id=2fb86873db4deaa49ac3c247d753a759568cf4a5
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> rabbitmq-c is not an embedded submodule since version 3.16.1 and
> https://github.com/balabit/syslog-ng/commit/c0559593c377f04662368dbecf282d2670aad12f
> 
> So enable/disable amqp depending on rabbitmq-c availability and remove
> uneeded -lrt from LIBS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Reviewed-by: Chris Packham <judge.packham@gmail.com>
> Signed-off-by: Fabrice Fontaine &lt;<a href="mailto:fontaine.fabrice@gmail.com" target="_blank" rel="noreferrer">fontaine.fabrice at gmail.com</a>&gt;<br></blockquote></div></div><div dir="auto"><br></div><div dir="auto">Looks good to me</div><div dir="auto"><br></div><div dir="auto">Reviewed-by: Chris Packham &lt;<a href="mailto:judge.packham@gmail.com">judge.packham at gmail.com</a>&gt;<br><br></div><div dir="auto"><div class="gmail_quote"><blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">

Not sure what happened here, but we have a nice amount of HTML crap :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
