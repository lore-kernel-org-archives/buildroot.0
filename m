From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Jun 2020 23:32:16 +0200
Subject: [Buildroot] Status of parallel build with Qt5
In-Reply-To: <3FC2CC68-E196-4121-9FB1-5BE83B58DBAC@getmailspring.com>
References: <3FC2CC68-E196-4121-9FB1-5BE83B58DBAC@getmailspring.com>
Message-ID: <20200608233216.0d0f494b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 8 Jun 2020 11:47:26 +0200
LP C <lpdev@cordier.org> wrote:

> Is there any status regarding the build of Qt5 with parallel build?

See this series from Andreas:

  https://patchwork.ozlabs.org/project/buildroot/list/?series=159093

> Wouldn't be possible to disable parallel build for this specific
> package in the meantime?

No, you can't disable parallel build for one specific package.

> PS: Newbie question here: what is the best practice to
> answer/participate to an old thread from the mailing list? As I don't
> have the email in my inbox, I cannot answer back, thus forcing me to
> start a new thread. Thanks

I'm not sure if the mbox is easily available from the archives. If it
was, you could import it in your e-mail client.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
