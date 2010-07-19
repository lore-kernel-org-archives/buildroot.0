From: Saa Isamit, Roberto <Roberto.Saa@sonda.com>
Date: Mon, 19 Jul 2010 12:04:50 -0400
Subject: [Buildroot] buildroot not using my proxy settings
Message-ID: <EE93B8B6CB04054E896A0763A45EF9EB01A51CFD@SONDA-EXCH01.sonda.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi:

 

            I have global proxy settings in my system but apparently
buildroot is not using them:

 

"export" command:

declare -x http_proxy="http://localhost:5865/"

 

            I'm using ntlmaps as a local proxy cause my company is using
a Microsoft proxy server.

 

            This settings work fine with everything else (firefox is
configured to use localhost as proxy and works fine).

 

            Does anyone know if there is another thing to configure to
get buildroot to use my proxy settings?

 

            My system is ubuntu linux 10.04 LTS and I'm using buildroot
v23434. Thanks in advance.

 

Regards



Sonda S.A.
Visite nuestra pagina: www.sonda.com
La informacion contenida en este correo electronico, asi como en cualquiera de sus archivos adjuntos, es confidencial y esta dirigida exclusivamente a el o los destinatarios indicados. Cualquier uso, reproduccion, divulgacion o distribucion por otras personas distintas de el o los destinatarios esta estrictamente prohibida. Si ha recibido este correo por error, por favor notifiquelo inmediatamente al remitente y borrelo de su sistema sin dejar copia del mismo. SONDA no acepta responsabilidad alguna por cualquier perdida o dano como consecuencia, directa o indirecta, del uso indebido de este e-mail o de los archivos adjuntos al mismo.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100719/c0defab8/attachment.html>
