From: Simon Dawson <spdawson@gmail.com>
Date: Thu, 25 Apr 2013 10:12:31 +0100
Subject: [Buildroot] buildroot with vwdial and vwstreams
In-Reply-To: <878v47bsjf.fsf@dell.be.48ers.dk>
References: <1933FF812CF8714890A209D3BC03BA0A45BF15360D@SI-MBX03.de.bosch.com>
 <1366832937.23813.YahooMailNeo@web133202.mail.ir2.yahoo.com>
 <878v47bsjf.fsf@dell.be.48ers.dk>
Message-ID: <CAHt8ZCMV_wYfcHFcDvBe4qpFiKm3BPZkYtVCvwRRaYfv57QN3A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24 April 2013 21:08, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "P" == P Aus stuttgart <handwerkundmehr@yahoo.de> writes:
>
> Hi Pascal,
>
>  P> according http://buildroot.uclibc.org/ you are the maintener of
>  P> buildroot.  Is it possible to include wvdial and wvstreams in it?
>  P> We are making an embedded system with an attached USB Modem
>  P> GPRS/HDSPA/UMTS and we would like to simplyfing the system
>  P> construction.  Thanks a lot.  Pascal
>
> Yes it is possible, but nobody has submitted patches adding vwdial /
> vwstreams yet. Perhaps you could do it?

I have some old patches knocking about somewhere to add wvstreams and
wvdial to buildroot; I'll post them to the mailing list. But I don't
have much interest in wvstreams/wvdial for my own use, so doubt I'll
be able to find much time to get the patches ship-shape. Pascal: if
you want to pick up these patches as a starting point for your own
work, then feel free.

Simon.
