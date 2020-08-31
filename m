From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 31 Aug 2020 22:59:52 +0200
Subject: [Buildroot] [PATCH 1/3] package/libupnp18: security bump to
 version 1.14.0
In-Reply-To: <CAPi7W81pMcWP57ieR+1c0nknUMez=mi6th5wDnZKBCP5Q_w_mA@mail.gmail.com>
 (Fabrice Fontaine's message of "Mon, 31 Aug 2020 22:20:40 +0200")
References: <20200821204139.3682940-1-fontaine.fabrice@gmail.com>
 <ee168046-5a2e-537c-8df2-9c4fd00bb757@mind.be>
 <CAPi7W81om-PW5JrYCtD05NXrUXgDUEh-XAJyv4onO-vtSTjj3A@mail.gmail.com>
 <87h7sibmjb.fsf@dell.be.48ers.dk>
 <CAPi7W81pMcWP57ieR+1c0nknUMez=mi6th5wDnZKBCP5Q_w_mA@mail.gmail.com>
Message-ID: <87zh6aa5vb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

Hi,

 >> So we would end up with package/libupnp = 1.14.0? Sounds sensible.
 > Yes ideally, we should have package/libupnp = 1.14.0. Would it be
 > acceptable/reasonable to bump libupnp from 1.6.x to 1.14.x and remove
 > libupnp18?

Yes. Both 1.6 and 1.18 are vulnerable, right? So if we want to fix the
CVE we need to do so.

 > If this is acceptable, I'll send a v2 of this serie (with the drop of
 > libupnp18 and the update of ushare/igd2-for-linux).

Thanks!

-- 
Bye, Peter Korsgaard
