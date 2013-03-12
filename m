From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Mar 2013 13:36:04 +0100
Subject: [Buildroot] [PATCH] qt5jsbackend: Remove dependency on bz2
	module
In-Reply-To: <1363084639-9610-1-git-send-email-arnout@mind.be>
References: <1362687540-19440-27-git-send-email-thomas.petazzoni@free-electrons.com>
 <1363084639-9610-1-git-send-email-arnout@mind.be>
Message-ID: <20130312133604.19ae49c5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Tue, 12 Mar 2013 11:37:19 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
> 
> The Python bz2 module is only needed in certain cases, so only import
> it when needed. In the normal qt5jsbackend build, this allows to remove
> the dependency on this module.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Hum, thanks but my Qt5 branch already has a similar patch:
http://git.free-electrons.com/users/thomas-petazzoni/buildroot/commit/?h=qt5&id=7c841620816f18bb4547bc905aa3255c7cb967b5

Or did I miss something?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
