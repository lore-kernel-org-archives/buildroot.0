From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 18 Jul 2014 10:53:09 +0200
Subject: [Buildroot] [PATCH 1/1] Add $$(PKG)_AUTORECONF_ENV argument to
 autotools package
In-Reply-To: <20140718102922.31712654@free-electrons.com>
References: <38A5475DE83986499AEACD2CFAFC3F9801148D7154@tss-server1.home.tropicalstormsoftware.com>
 <20140717204350.6cedbf85@free-electrons.com>
 <38A5475DE83986499AEACD2CFAFC3F9801148D7428@tss-server1.home.tropicalstormsoftware.com>
 <20140718102922.31712654@free-electrons.com>
Message-ID: <CAAXf6LWuBtJQ9Z3MVurwBF0QCocZj91wazh62gNLmj=B1f6yBA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Rick,

On Fri, Jul 18, 2014 at 10:29 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Rick Taylor,
>
> On Fri, 18 Jul 2014 08:21:34 +0000, Rick Taylor wrote:
>
>> Unfortunately I am stuck on a machine with no outgoing SMTP server on
>> the network.
>
> Not even GMail's one? That's usually how most people workaround stupid
> company restrictions.

Indeed.
If there is a proxy, you may need to set up a socat tunnel, see
http://lists.busybox.net/pipermail/buildroot/2014-June/099502.html

Best regards,
Thomas
