From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 29 Jan 2015 21:48:50 +0200
Subject: [Buildroot] Command line tool to manage MBR partition
In-Reply-To: <CAFRxoJncaGDrer4Aa-pbFY1_zsGCLpgxdGcJqvF_3sC9noFpSg@mail.gmail.com>
References: <CAFRxoJncaGDrer4Aa-pbFY1_zsGCLpgxdGcJqvF_3sC9noFpSg@mail.gmail.com>
Message-ID: <20150129194850.GK19448@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Marco,

On Thu, Jan 29, 2015 at 03:13:58PM +0100, Marco Pastorelli wrote:
> I can't find sfdisk on buildroot-2014.08, has it been removed?
> Is there any other command line tool to manage MBR partition?

sfdisk and fdisk are provided by the util-linux package. Make sure to enable 
the "install utilities" option if you need these utilities.

Hope this helps,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
