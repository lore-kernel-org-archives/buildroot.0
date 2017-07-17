From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Jul 2017 13:25:47 +0200
Subject: [Buildroot] Autobuilder reporting old build issues
In-Reply-To: <CANQCQpZtCQzSVZMgt=+qt7DEfMJE3WSPE4EWvM4iA+Rzt=Lh6w@mail.gmail.com>
References: <20170715100105.108fb7ab@windsurf>
 <20170716102002.6d570790@windsurf>
 <CANQCQpZtCQzSVZMgt=+qt7DEfMJE3WSPE4EWvM4iA+Rzt=Lh6w@mail.gmail.com>
Message-ID: <20170717132547.239ba12f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Jul 2017 06:18:54 -0500, Matthew Weber wrote:

> I had pointed the Buildroot git  remote at our internal mirror because
> of network issues fetching (this could lead to a delay of ~12hrs or
> longer if the mirrors can't fetch).  I'll take a look at the
> autobuilder script and instead of pointing at the mirror, I'll improve
> error handling of when the remote fails to fetch.  Once this is tested
> out, I'll respond back.

Have you tried using the github.com mirror instead ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
