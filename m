From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 24 Oct 2014 13:36:46 -0300
Subject: [Buildroot] [PATCHv2] spidev_test: new package
In-Reply-To: <20141024140100.GA2220@tarshish>
References: <1414155897-2687-1-git-send-email-gustavo@zacarias.com.ar>
 <20141024140100.GA2220@tarshish>
Message-ID: <544A801E.9070606@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/24/2014 11:01 AM, Baruch Siach wrote:
>> +# Newest version requires SPI_TX_QUAD/SPI_RX_QUAD to build
> 
> I'd add that SPI_TX_QUAD is also an ABI change to make the next line clearer.
> 
>> +# Pretty safe assumption that toolchain headers are <= runtime kernel version
> 
> This assumption should at least be documented in the help text, IMO.

Hi Baruch.
Ok.

> Why not use kernel version tags, v3.14 and v3.15?

Force of habit, i'll switch to tags for clarity.
Regards.
