From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 31 Jan 2012 12:26:40 +0100
Subject: [Buildroot] [PATCH 1/6] dbus: make it easier to select an XML
	library (select rather than depends on)
In-Reply-To: <1327621292-13580-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Fri, 27 Jan 2012 00:41:27 +0100")
References: <CAFbHwiTmVeZYM_OBKzzNLkdvbr30RG06wi8FxFzbhVhP9KcTbw@mail.gmail.com>
 <1327621292-13580-1-git-send-email-arnout@mind.be>
Message-ID: <87fwewjeof.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

 Arnout> D-Bus requires an XML library, expat or libxml2.  There already
 Arnout> is a choice between them in the config menu, but it requires
 Arnout> the user to first select one of the libraries, and then select
 Arnout> dbus.  With this patch, the choice automatically selects the
 Arnout> XML library.  Note that this removes the automatic choice of
 Arnout> libxml2 for dbus if libxml2 had already been selected, i.e. in
 Arnout> that case both libxml2 and expat will be selected unless the
 Arnout> user takes action.

Committed entire series, thanks.

-- 
Bye, Peter Korsgaard
