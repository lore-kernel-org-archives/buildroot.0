From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Mar 2015 09:33:38 +0100
Subject: [Buildroot] [PATCH v5 03/11] autobuild-run: add option
 --make-opts for custom Buildroot options
In-Reply-To: <CAAXf6LVaaz7UhstS+aZVsat=N1DUm02Dk6RC=TDvYoxK-0Rdsg@mail.gmail.com>
References: <1418414696-32584-1-git-send-email-patrickdepinguin@gmail.com>
 <1418414696-32584-4-git-send-email-patrickdepinguin@gmail.com>
 <20150228202909.3b5ce127@free-electrons.com>
 <CAAXf6LVaaz7UhstS+aZVsat=N1DUm02Dk6RC=TDvYoxK-0Rdsg@mail.gmail.com>
Message-ID: <20150302093338.75ab5e78@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Sun, 1 Mar 2015 21:42:34 +0100, Thomas De Schampheleire wrote:

> make-opts is given the empty string '' as default in the original code
> I sent, and thus can be splitted without the above error. I guess you
> are seeing this after making some other change?

Nope, I don't think I've done any change regarding this, unless I did
a mistake, of course. You can see the code as I tested it in the Git
repository I pointed at.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
