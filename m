From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 14 Jan 2013 12:37:28 +0100
Subject: [Buildroot] Currently packaging Qt5
In-Reply-To: <20130114105802.1199d10e@skate>
References: <20130114105802.1199d10e@skate>
Message-ID: <50F3EDF8.6010203@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni wrote:
> Hello,
>
> This is just a quick note to let people know that I've started
> packaging Qt5. I'm re-using existing packaging efforts done by
> RasberryPi folks, and I'm already quite far in the process. I hope to
> be able to post something soon.

Great!

Are you going to leave the option in BR to use the old QT4?
I think it would be useful, mostly for boards having no OGLES
acceleration, as well as to avoid any backward compatibility issues
for old application code.

Luca
