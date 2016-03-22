From: gwenhael.goavec <gwenj@trabucayre.com>
Date: Tue, 22 Mar 2016 08:26:16 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-03-20
In-Reply-To: <4i67scxc49.ln2@ID-313208.user.individual.net>
References: <20160321073023.C428D1023A9@stock.ovh.net>
 <4i67scxc49.ln2@ID-313208.user.individual.net>
Message-ID: <20160322082616.1dce4f0e@x230.trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 22 Mar 2016 07:50:12 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Am Mon, 21 Mar 2016 08:30:23 +0100 schrieb Thomas Petazzoni:
> 
> > Build statistics for 2016-03-20
> > ===============================
> > 
> >         success : 203
> >        failures : 167
> >        timeouts : 1  
> >           TOTAL : 371
> > 
> > Classification of failures by reason
> > ====================================
> > 
> >               gnuradio-3.7.9.1 | 35  
> 
> Hi,
> 
> the reason for the build failures is the cmake bump to 3.5.0,
> reverting it solves the problem. A quick analysis showed that for
> boost being detected as a valid installation BR2_PACKAGE_BOOST_ATOMIC
> is needed. This fix alone does not fix the compile problem however,
> it seems BR2_PACKAGE_PYTHON is needed as well and maybe more.
> I was unable to perform an error-free configure stage with cmake
> 3.5.0 so my conclusions about the cause are incomplete. What is sure
> however is that with cmake 3.4.3 gnuradio compiles without problems.
> 
> Regards, Bernd
> 
Hi,
I'm working on it issues. The cmake issue is fixed (needs to be send)
and I'll check the rest.

Regards,
Gwen
