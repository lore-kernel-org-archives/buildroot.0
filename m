From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Oct 2017 21:25:45 +0200
Subject: [Buildroot] [buildroot] No hash found for gcc-5.4.0.tar.bz2.
In-Reply-To: <e953736f09ba4dd6a73358abf69f44aa@draper.com>
References: <e953736f09ba4dd6a73358abf69f44aa@draper.com>
Message-ID: <20171016212545.78715dff@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 16 Oct 2017 19:07:53 +0000, Lim, Sungyung wrote:

> As a beginner, I'm looking for some advices on the issue : No hash found for gcc-5.4.0.tar.bz2.
> 
> Here is a copy of the log from running buildroot make command:
> 
> >>> host-gcc-initial 5.4.0 Downloading  
> Saving to ~output/build/.gcc-5.4.-.tar.bz2.aYTUOP/output
> ~output/build/.gcc-5.4.0.tar.bz2.aYTUOP/output' saved
> ERROR: No hash found for gcc-5.4.0.tar.bz2
> Make[1]: *** [~output/build/host-gcc-initial-5.4.0/.stamp_downloaded] Error 1
> Make: *** [_all] Error 2

Which version of Buildroot are you using? What is your
Buildroot .config?

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
