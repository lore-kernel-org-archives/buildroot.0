From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 30 Apr 2016 22:57:18 +0200
Subject: [Buildroot] [PATCH v2 4/4] samba4: remove compilation of .pyc
	files
In-Reply-To: <1462020471-29986-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1462020471-29986-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1462020471-29986-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAHXCMM+oLmx_MsGPLTnn9Z_zaGc2C6rZNjKJfUN5XAE0wu1o4A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, all,

On Sat, Apr 30, 2016 at 2:47 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Now that .py files are globally compiled into .pyc files, we can get
> rid of the samba4 specific logic doing this compilation.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>

Regards,

-- 
Samuel
