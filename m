From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 23 Aug 2016 12:09:54 +0200
Subject: [Buildroot] [PATCH/next 2/4] DEVELOPERS: add initial list of
 Buildroot developers
In-Reply-To: <1471902678-18693-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1471902678-18693-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1471902678-18693-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <670f6e5c-e513-6b3f-ed82-4da1ddc3d141@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

On 22/08/2016 23:51, Thomas Petazzoni wrote:
> This is an initial list of Buildroot developers. It has been created
> semi-automatically by parsing the Git history, and finding the authors
> of commits with a title like "<foo>: new package". Some additional
> manual tweaking has been done (merging multiple entries corresponding to
> the same person, adding some more entries, etc.).
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

[...]

> +N:	Luca Ceresoli <luca@lucaceresoli.net>
> +F:	package/agentpp/
> +F:	package/exim/
> +F:	package/ffmpeg/
> +F:	package/linphone/

I haven't had any role on the ffmpeg and linphone packages since >4
years now. I think this line should be removed from under my name.

> +F:	package/qpid-proton/
> +F:	package/rtl8188eu/
> +F:	package/stm32flash/
> +F:	package/unzip/

Ok for these.

Also, as Bernd suggested, libpjsip should be added.

-- 
Luca
