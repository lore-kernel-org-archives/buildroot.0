From: Chris Packham <judge.packham@gmail.com>
Date: Thu, 21 Feb 2019 23:20:11 +1300
Subject: [Buildroot] [git commit] package/syslog-ng: add optional
 rabbitmq-c dependency
In-Reply-To: <45b79d19-85cf-1e77-b8a3-02c38cb1f03b@mind.be>
References: <20190220222409.4FDA88B910@busybox.osuosl.org>
 <20190221093203.3547119a@windsurf>
 <45b79d19-85cf-1e77-b8a3-02c38cb1f03b@mind.be>
Message-ID: <CAFOYHZDFXQkMB5DU-C3CAX2yJi-2HQ3rK7-Lq39wVb65_q5GOw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 21 Feb 2019 22:08 Arnout Vandecappelle <arnout@mind.be wrote:

>
>
> On 21/02/2019 09:32, Thomas Petazzoni wrote:
> > On Wed, 20 Feb 2019 23:26:04 +0100
> > Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> wrote:
> >
> >> commit:
> https://git.buildroot.net/buildroot/commit/?id=2fb86873db4deaa49ac3c247d753a759568cf4a5
> >> branch:
> https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> >>
> >> rabbitmq-c is not an embedded submodule since version 3.16.1 and
> >>
> https://github.com/balabit/syslog-ng/commit/c0559593c377f04662368dbecf282d2670aad12f
> >>
> >> So enable/disable amqp depending on rabbitmq-c availability and remove
> >> uneeded -lrt from LIBS
> >>
> >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> >> Reviewed-by: Chris Packham <judge.packham@gmail.com>
> >> Signed-off-by: Fabrice Fontaine &lt;<a href="mailto:
> fontaine.fabrice at gmail.com" target="_blank" rel="noreferrer">
> fontaine.fabrice at gmail.com</a>&gt;<br></blockquote></div></div><div
> dir="auto"><br></div><div dir="auto">Looks good to me</div><div
> dir="auto"><br></div><div dir="auto">Reviewed-by: Chris Packham &lt;<a
> href="mailto:judge.packham at gmail.com">judge.packham at gmail.com</a>&gt;<br><br></div><div
> dir="auto"><div class="gmail_quote"><blockquote class="gmail_quote"
> style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
> >
> > Not sure what happened here, but we have a nice amount of HTML crap :-)
>
>  Probably patchwork misparsed the HTML mail with Chris's Reviewed-by. I
> reviewed
> the patch on the website and didn't look at the result of pwclient git-am
> anymore :-(
>

Yeah sorry for my part. I replied from a smart device which is obviously
too dumb to just pass email around as plain text.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190221/e8b6bdec/attachment.html>
