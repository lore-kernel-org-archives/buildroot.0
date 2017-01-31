From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 31 Jan 2017 10:30:11 +0200
Subject: [Buildroot] LIBFOO_GIT_SUBMODULES
In-Reply-To: <CABLXdK9xko_SrWN1JQtSwZTxJ8PJuW=CVr6b4D4XR8RiEMXfcg@mail.gmail.com>
References: <CABLXdK9xko_SrWN1JQtSwZTxJ8PJuW=CVr6b4D4XR8RiEMXfcg@mail.gmail.com>
Message-ID: <20170131083011.ut2ltabpqw23v2m5@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ricardo,

On Tue, Jan 31, 2017 at 09:20:46AM +0100, Ricardo Herrero wrote:
>  I?m trying to use github to download a repository with submodules, as if I
> we using "*git clone --recursive*". The manual talks about
> *LIBFOO_GIT_SUBMODULES
> *when you set *LIBFOO_SITE_METHOD = git* but the manual doesn?t say
> anything about what we are supposed to configure in this variable. Do we
> have to write Y or YES? The fact is that it is not working and buildroot
> does not give any advice.

You may set LIBFOO_GIT_SUBMODULES to any non-empty value to trigger a 
recursive git clone.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
