From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 27 Oct 2020 09:25:46 +0100
Subject: [Buildroot] [PATCH v3,2/2] package/zeek: new package
In-Reply-To: <CAPi7W80jJeG5jhntYjPmok_HmDAC19GU=fFbmgDVX2ygqx78rA@mail.gmail.com>
References: <20201025161246.1622486-1-fontaine.fabrice@gmail.com>
 <20201025161246.1622486-2-fontaine.fabrice@gmail.com>
 <20201026220841.085177d8@windsurf.home>
 <CAPi7W80jJeG5jhntYjPmok_HmDAC19GU=fFbmgDVX2ygqx78rA@mail.gmail.com>
Message-ID: <20201027092546.17cb7900@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 26 Oct 2020 23:50:22 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> > Does this needs to be a post-configure hook ? Isn't that needed simply
> > after the installation ?  
> I can't use @PYTHON_EXECUTABLE@ in a post install hook as cmake will
> replace it with the expanded value of $(HOST_DIR)/bin/python.
> I could replace $(HOST_DIR) by /usr in a post install hook but I find
> this solution less elegant.
> Another option would be to patch ssh_runner.py but I don't think that
> upstream will accept that we hardcode /usr/bin/python.

OK, thanks for the additional explanation, makes sense.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
