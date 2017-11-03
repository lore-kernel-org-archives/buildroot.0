From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri, 3 Nov 2017 12:08:43 -0700
Subject: [Buildroot] [PATCH 1/2] package: add python-raven
In-Reply-To: <20171102213208.4d4236aa@windsurf>
References: <20171102163419.24155-1-joseph.kogut@gmail.com>
 <20171102213208.4d4236aa@windsurf>
Message-ID: <CAMWSM7gV0Fg64+fbGMF9P00N9mnmu3VEugiYKc=S0sQpO6aeDA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Thanks for the feedback,

> Please include the change to the DEVELOPERS file in the same patch, no
need to make it a separate patch.

The manual states at the end of section 21.5.1:

> If you are interested in getting notified of build failures and of further
> changes in the packages you added or modified, please add yourself to the
> DEVELOPERS file. This should be done in a separate patch of the series.

Did I misunderstand this section, or should the documentation be updated?

> It really doesn't have *any* runtime dependency on other Python
modules? I.e if you build just python-raven and the minimal python
interpreter, it works?

Now that you mention it, it doesn't have any external requirements,
but I'm unsure as to whether or not it requires any optional core
modules. I would assume that it needs urllib at least. I'll test it
and find out.

> Could you respin an updated version that
takes into account those comments?

Absolutely, thanks for taking the time to review this.
