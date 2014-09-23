From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Sep 2014 09:44:38 +0200
Subject: [Buildroot] Building buildroot with python (32bit) on 64bit
 ubuntu machine
In-Reply-To: <CAAwwcmSuLGjmmhaWxyKrfyVaVtMsFr9m9v7aWTFfdOrRiUgf5A@mail.gmail.com>
References: <CACUGKYP70McERSyUD7J2KysYZ7crf6fJ4y46CqSfRPDFNAvoTw@mail.gmail.com>
 <CAAwwcmSuLGjmmhaWxyKrfyVaVtMsFr9m9v7aWTFfdOrRiUgf5A@mail.gmail.com>
Message-ID: <20140923094438.4c143368@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Oli Vogt,

On Tue, 23 Sep 2014 17:39:54 +1200, Oli Vogt wrote:

> I build for ARM 32-bit and started working on the new module
> python-smbus-cffi a few weeks ago. After running into problems I could not
> finish my investigations because of other more urgent work.
> Here are the notes I made:
> 
> On a 64-bit host: the build/install of python-smbus-cffi fails as follows:

Could you post as RFC the current state of your patch adding
python-smbus-cffi ? I've done a fair bit of work on the Python stuff,
so I might be able to look into this and see what's going on.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
