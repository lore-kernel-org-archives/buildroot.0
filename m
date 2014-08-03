From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Aug 2014 10:30:48 +0200
Subject: [Buildroot] [PATCH 1/1] qt: make installation of translation
 files optional
In-Reply-To: <1406948936-1962-1-git-send-email-danomimanchego123@gmail.com>
References: <1406948936-1962-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20140803103048.53f2b086@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi Manchego,

On Fri,  1 Aug 2014 23:08:56 -0400, Danomi Manchego wrote:
> Commit 93917b6980f7f2b51302e1a3fa451b07cf7d674e introduced the
> installation of the binary .qm translation files, unconditionally.
> This patch introduces an option to disable this behavior, saving
> almost 8MB of space.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

Thanks, I've applied your patch, after renaming the option and moving
it a bit in Config.in, so that it doesn't appear in the middle of the
Qt modules options.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
