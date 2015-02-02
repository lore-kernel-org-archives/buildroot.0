From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Feb 2015 17:54:55 +0100
Subject: [Buildroot] board-specific autotools env customization
In-Reply-To: <CAKAx1chT6Grx+oRMiQy5t29TUe=avo6v9CR2nP1GZ6Lf1-a-5A@mail.gmail.com>
References: <CAKAx1chT6Grx+oRMiQy5t29TUe=avo6v9CR2nP1GZ6Lf1-a-5A@mail.gmail.com>
Message-ID: <20150202175455.5dd5c2e3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Lionel Orry,

On Mon, 2 Feb 2015 15:05:06 +0100, Lionel Orry wrote:

> I would like to use a specific XXX_CONF_ENV variable to send ac_cv_...
> variables to configure, but they are specific to my compiler. For my tests,
> I currently write the XXX_CONF_ENV directly into the package .mk file, but
> I would like to know if there is a better way. I already use the
> recommended board/<company>/<board>/patches/ infrastructure, but this is
> not a patch so I don't know where to put it...
> 
> Any advice / best practice ?

Well, only pass this <pkg>_CONF_ENV if you're using your specific
compiler?

Maybe if you could be more specific and tell us which compiler / which
environment variable you need to pass, we could give more hints.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
