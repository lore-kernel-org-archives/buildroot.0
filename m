From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 28 Feb 2013 08:36:46 -0300
Subject: [Buildroot] WebkitGtk upgradation
In-Reply-To: <20130228122855.6ceb26ce@skate>
References: <CAJsG2H5B=ZdfDZm_wTmOqMkG6_kME=y_7oc5gkMygtd6HA4p+g@mail.gmail.com>
 <512F0B0A.4050403@relinux.de>
 <CAJsG2H4pZWE7FZGFUJuhYhjrNkf0Aa62y12WW3YQdbScJ1HTtA@mail.gmail.com>
 <CAFbHwiTZgmQn8EChYXSLAmmr9+WSoVLL5jUBqnOYA7qzUNFCnA@mail.gmail.com>
 <20130228122855.6ceb26ce@skate>
Message-ID: <512F414E.5090203@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/28/2013 08:28 AM, Thomas Petazzoni wrote:

> My feeling is also that the DirectFB backend of Gtk has never been
> seriously maintained over time. There are from time to time some people
> who fix the issues, but then it goes on unmaintained for a number of
> months/years, during which it slowly degrades into an unusable state.
> 
> I would therefore suggest that Buildroot follows upstream: get rid of
> the DirectFB backend. If anyone really wants the DirectFB backend in
> Gtk, then it should be fixed upstream. But I don't think it should
> force Buildroot users to stay with old Webkit/Gtk because of this.

+1
Our current webkit-gtk has more CVEs than spots on a dalmatian dog.
Regards.
