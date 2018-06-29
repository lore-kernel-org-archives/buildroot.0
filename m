From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 29 Jun 2018 14:50:39 +0300
Subject: [Buildroot] [PATCH v2] dropbear: enable PAM athentication if
 linux-pam is selected
In-Reply-To: <20180629105818.5625-1-casantos@datacom.com.br>
References: <20180629043644.e4xgahymqctqr7ha@tarshish>
 <20180629105818.5625-1-casantos@datacom.com.br>
Message-ID: <20180629115039.52bpwyk7xenbly53@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Carlos,

On Fri, Jun 29, 2018 at 07:58:18AM -0300, Carlos Santos wrote:
> - Disable password file athentication, since it's not possible to have
>   both at once.
> - Install a /etc/pam.d/sshd file, based on the one installed by openssh.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.com.br>

Reviewed-by: Baruch Siach <baruch@tkos.co.il>

Please keep the review tag in subsequent patch submissions.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
