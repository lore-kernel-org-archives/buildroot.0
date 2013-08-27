From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Aug 2013 22:50:53 +0200
Subject: [Buildroot] [1/1] civetweb: new package
In-Reply-To: <CAG3-AMq4Y-+gVWQ_062FjeLh_=HxuvXDqRzCdWEEjOP+WUCBuQ@mail.gmail.com>
References: <CAG3-AMrakjHihP-_Zr7E4zX=BSs7Ym+Fc8HSVDbQbt11t4K0sQ@mail.gmail.com>
 <20130827203958.2de34c38@skate>
 <CAG3-AMpi1X5xKO08bE+pfp5Or5qeYWbLiKt33aWBTpqVC4ToTg@mail.gmail.com>
 <20130827211557.1416d328@skate>
 <CAG3-AMq4Y-+gVWQ_062FjeLh_=HxuvXDqRzCdWEEjOP+WUCBuQ@mail.gmail.com>
Message-ID: <20130827225053.45a6b76d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Davis,

On Tue, 27 Aug 2013 15:28:49 -0400, Thomas Davis wrote:
> Thanks once again for the reply and the detailed examination.  I will
> see about having a non large file option in the civetweb build and
> test that separately before continuing.    I will also add the comment
> about LUA and sqlite3 not coming from buildroot and move the document
> directory as well.

As I said, support non-large file builds is really not mandatory. You
can submit your package without supporting non-large file builds for
the moment, and if you're interested, you can send later a followup
patch to make this possible. But we have plenty of packages that don't
support non-large file builds in Buildroot, so it's not really a
problem to have another one.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
