From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Feb 2013 13:08:28 +0100
Subject: [Buildroot] [PATCH v2] vim: Add post-install hook to remove
 documentation from target
In-Reply-To: <CAG2jQ8jzrz=fUPuqkjQTGfhWrcNCb-dZKSye=XQo3fmjoPvfUA@mail.gmail.com>
References: <1360666299-3661-1-git-send-email-markos.chandras@gmail.com>
 <20130212122323.276f018f@skate>
 <CAG2jQ8jzrz=fUPuqkjQTGfhWrcNCb-dZKSye=XQo3fmjoPvfUA@mail.gmail.com>
Message-ID: <20130212130828.22a0522e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Markos Chandras,

On Tue, 12 Feb 2013 11:59:16 +0000, Markos Chandras wrote:

> I agree but seeing how the VIM_INSTALL_RUMTIME_CMDS is implemented, I
> figured this was the recommended practice.
> If you need me to submit a new patch please let me know.

For me, the patch is fine as is, since it's a rule we haven't been
enforcing everywhere.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
