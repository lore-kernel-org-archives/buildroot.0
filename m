From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Sat, 1 Nov 2008 20:15:19 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
In-Reply-To: <061E11D86E3DFF459604DF5B36F0805F1BA6D3@salka01.valka.local>
References: <20081031171723.6F149F8055@busybox.net>
	<200811011247.26080.markus.heidelberg@web.de>
	<061E11D86E3DFF459604DF5B36F0805F1BA6D3@salka01.valka.local>
Message-ID: <200811012015.19425.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnar Mar Sigur?sson, 01.11.2008:
> >> +	default n
> > is not necessary in all the options
> Is "default n" the default? Was not sure because i have seen other packages
> use "default n".

Yes, it is.
find package -name Config.* -exec grep "default n" {} \;
only shows 7 lines. Look at revision 22874 from 2008-07-17 where all the
"default n" lines were removed.

Markus
