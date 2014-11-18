From: Laurent GONZALEZ <br2@gezedo.com>
Date: Tue, 18 Nov 2014 14:57:12 +0100
Subject: [Buildroot] Unable to boot Arm926t with big endian support
In-Reply-To: <B28B6A721CC23347BBD5566C377D30416461F1CA@se-got-mb01.semcon.se>
References: <B28B6A721CC23347BBD5566C377D30416461F1CA@se-got-mb01.semcon.se>
Message-ID: <546B5038.4090104@gezedo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/11/2014 12:22, Peder Alm wrote:
> CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=00053177

If cr is the ARM926 control register, cr[7] is a bit that indicates you are running in little endian.

--
Laurent
