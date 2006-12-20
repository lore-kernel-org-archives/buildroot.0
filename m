From: Bernhard Fischer <rep.nop@aon.at>
Date: Wed, 20 Dec 2006 18:25:51 +0100
Subject: [Buildroot] Errors while building iproute2
In-Reply-To: <5e15b0e10612200702j20318545k82a4d1b3fdb47189@mail.gmail.com>
References: <5e15b0e10612200344u75903c18m80e72d5322cdc451@mail.gmail.com>
	<5e15b0e10612200702j20318545k82a4d1b3fdb47189@mail.gmail.com>
Message-ID: <20061220172551.GC24825@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 20, 2006 at 04:02:48PM +0100, Rory Slegtenhorst wrote:
>Fixed this by using a different version of flex.
>
>Note:
>  SuSE 9.3 comes with flex 2.5.4 whilst SuSE 10.1 comes with flex 2.5.31.
>
>So for some reason this newer version breaks the iproute2 build...

funny enough, flex 2.5.31 from ubuntu and debian work for me..

Thanks for the heads-up,
