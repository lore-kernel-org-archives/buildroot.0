From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Aug 2019 14:29:07 +0200
Subject: [Buildroot] [PATCH v2 3/5] autobuild-run: make diffoscope
 output a JSON-formatted file as well
In-Reply-To: <CABM+sgpWZQd0f9oReBXd=6Vjbj+E2OanQW8tEU_Dd-tR1qtpEg@mail.gmail.com>
References: <20190810035902.14047-1-itsatharva@gmail.com>
 <20190810035902.14047-3-itsatharva@gmail.com>
 <20190811154137.0840ee6e@windsurf.home>
 <CABM+sgpWZQd0f9oReBXd=6Vjbj+E2OanQW8tEU_Dd-tR1qtpEg@mail.gmail.com>
Message-ID: <20190813142907.6d403904@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Atharva,

On Tue, 13 Aug 2019 09:37:27 +0530
Atharva Lele <itsatharva@gmail.com> wrote:

> > > +        reproducible_results_text = os.path.join(self.outputdir, "results", "reproducible_results_text")  
> >  
> 
> There's a typo here. Variable is named reproducible_results_txt in the
> patch, but in the diffoscope command I have used
> reproducible_results_text. I'll send a patch fixing this and the
> command consistency.

My bad. I initially started changing the variable names to something
more sensible, such as "diffoscope_results_json" and
"diffoscope_results_txt" and then changed my mind, as it should have
been a separate patch. But apparently, I undid my change incorrectly.
Sorry about this.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
