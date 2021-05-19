From: Weber, Matthew L                            Collins <Matthew.Weber@collins.com>
Date: Wed, 19 May 2021 20:03:39 +0000
Subject: [Buildroot] [External] [PATCH next] package/libcurl: make sure
 openssl supports DES
In-Reply-To: <d358be700aa4dcfe0df4ba7f15832d4721f718ba.1621450908.git.baruch@tkos.co.il>
References: <d358be700aa4dcfe0df4ba7f15832d4721f718ba.1621450908.git.baruch@tkos.co.il>
Message-ID: <DM2P110MB01053E590F79AA98F110BB87F22B9@DM2P110MB0105.NAMP110.PROD.OUTLOOK.COM>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch,

> From: Baruch Siach <baruch@tkos.co.il>
> Sent: Wednesday, May 19, 2021 2:01 PM
> To: buildroot at busybox.net <buildroot@busybox.net>
> Cc: Weber, Matthew L Collins <Matthew.Weber@collins.com>; Baruch Siach <baruch@tkos.co.il>; Erwan GAUTRON <erwan.gautron@bertin.fr>
> Subject: [External] [PATCH next] package/libcurl: make sure openssl supports DES
> ?
> DES support in openssl is optional since commit a83d41867c8d
> ("package/libopenssl: add option to enable some features"). curl uses
> DES support in openssl when enabled. Select DES support to avoid build
> failure.
>
> Fixes:
> https://urldefense.com/v3/__http://autobuild.buildroot.net/results/8931fd2b71eb2490cdc041b47eff58377ac823da/__;!!MvWE!UmmU9q2BBP6QgUqCoJpck8B7DmzN-ei9QwOYrMj6DeAe2jpT3oKVDmRmO5OH6awGw02G$
> https://urldefense.com/v3/__http://autobuild.buildroot.net/results/f159195adf05c375d7d314a270afd3a55d43ebdd/__;!!MvWE!UmmU9q2BBP6QgUqCoJpck8B7DmzN-ei9QwOYrMj6DeAe2jpT3oKVDmRmO5OH6RjpJmrT$
> https://urldefense.com/v3/__http://autobuild.buildroot.net/results/e143c75bccd7bcd4216954b76099404a38cf9bc1/__;!!MvWE!UmmU9q2BBP6QgUqCoJpck8B7DmzN-ei9QwOYrMj6DeAe2jpT3oKVDmRmO5OH6cOXd9jD$
>
> Cc: Erwan GAUTRON <erwan.gautron@bertin.fr>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Reviewed-by: Matthew Weber <matthew.weber@collins.com>
